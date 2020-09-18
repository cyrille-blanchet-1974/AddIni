mod paramcli;
mod read;
mod write;
mod replace;

use std::fs::*;
use std::sync::mpsc::channel;
use paramcli::*;
use read::*;
use replace::*;
use write::*;

pub fn traitement(fic:&str,section:&str,key:&str,value:&str,keep_old:bool){
    let mut fic_out = String::from(fic);
    fic_out.push_str(".chg");

    //MPSC chanels
    let (to_search, from_read) = channel();
    let (to_write, from_search) = channel();

    let hread = start_thread_read(to_search,fic);
    let hsearch = start_thread_search(from_read,to_write,section,key,value);
    let hwrite = start_thread_write(from_search,&fic_out);

    //wait for threads to stop
    if hread.join().is_err() {
        println!("Thread read finished with error");
    }
    if hsearch.join().is_err() {
        println!("Thread search finished with error");
    }
    if hwrite.join().is_err() {
        println!("Thread write finished with error");
    }

    if keep_old{
        let mut fic_old = String::from(fic);
        fic_old.push_str(".old");
        if rename(&fic, &fic_old).is_err(){
            println!("erreor renaming {} to {} aborting",fic,fic_old);
            return;
        }
    }else if remove_file(fic).is_err(){
        println!("erreor removing {} aborting",fic);
        return;
    }
    if rename(&fic_out, &fic).is_err(){
        println!("erreor renaming {} to {} aborting",fic_out,fic);
        return;
    }
}

fn main() {
    println!("addini 1.0 (2020)");
    let param = Paramcli::new();
    traitement(&param.fic,&param.section,&param.key,&param.value,param.keep_old);
}