namespace mycapapp.db;

context master {
    entity student {
        key id :String(32);
        name : String(80);
        age : Int32;
        brilliant : Boolean;
        Semester : String(32);

    }
    entity semester {
        key id : String(32);
        sem : String(32);
        specialization : String(32);
        hod : String(80);

    } 
    entity books {
        name : String(80);
        key id : String(32);
        author : String(50);

    }
}
