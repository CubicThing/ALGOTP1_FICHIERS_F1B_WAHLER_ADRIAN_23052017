program verbes;

TYPE
    verbe = record
    
    inf : string;
    gr : integer;
END;

procedure remplir(var f : text;var e : text);
BEGIN
    rewrite(f);
    writeln(f,'rire');
    writeln(f,'recevoir');
    writeln(f,'aller');
    writeln(f,'bouillir');
    writeln(f,'envoyer');
    writeln(f,'peindre');
    writeln(f,'habiter');
    writeln(f,'payer');
    writeln(f,'mourir');
    writeln(f,'hair');
    writeln(f,'vouloir');
    writeln(f,'finir');
    writeln(f,'s amuser');
    close(f);
    
    rewrite(e);
    writeln(e,'aller');
    writeln(e,'vouloir');
    writeln(e,'mourir');
    writeln(e,'s amuser');
    writeln(e,'recevoir');
    writeln(e,'peindre');
    writeln(e,'rire');
    close(e);
END;

procedure determiner(var t : array of verbe;var f : text;var e : text);
VAR

    verbe : string;
    exc : string;
    terminaison : string;
    i : integer;
    isexc : boolean;
    
BEGIN
    reset(f);
    for i := 0 to 12 do
    BEGIN
        reset(e);
        isexc := false;
        readln(f,verbe);
        t[i].inf := verbe;
        terminaison := verbe[length(verbe)-1] + verbe[length(verbe)] ;
        
        
        while not EoF(e) do
        BEGIN
            readln(e,exc);
            if verbe = exc then isexc := true;
        END;
        
        
        if isexc then t[i].gr := 3
        else if terminaison = 'er' then t[i].gr := 1
        else if terminaison = 'ir' then t[i].gr := 2;
    END;
    close(f);
    close(e);
END;

procedure conjuguer1(v : verbe; var f : text);
VAR
    rad : string;
    i : integer;
BEGIN
    rad := ' ';
    
    for i := 1 to (length(v.inf)-2) do rad := rad + v.inf[i];
    
    writeln(f,v.inf,' :');
    writeln(f,'Je ',rad,'e');
    writeln(f,'Tu ',rad,'es');
    writeln(f,'Il ',rad,'e');
    writeln(f,'Nous ',rad,'eons');
    writeln(f,'Vous ',rad,'ez');
    writeln(f,'Ils ',rad,'ent');
    writeln(f,'');
    
    rad := '';
END;

procedure conjuguer2(v : verbe; var f : text);
VAR
    rad : string;
    i : integer;
BEGIN
    rad := ' ';
    
    for i := 1 to (length(v.inf)-2) do rad := rad + v.inf[i];
    
    writeln(f,v.inf,' :');
    writeln(f,'Je ',rad,'is');
    writeln(f,'Tu ',rad,'is');
    writeln(f,'Il ',rad,'it');
    writeln(f,'Nous ',rad,'issons');
    writeln(f,'Vous ',rad,'issez');
    writeln(f,'Ils ',rad,'issent');
    writeln(f,'');

    
    rad := '';
END;

{
procedure conjuguer3(v : verbe; var f :text);
VAR
    i : integer;
    ter : string;
BEGIN
    case rad of
        
        'ir':
        
        
        
        
    END;
END;
}

procedure conjuguer(t : array of verbe; var f : text);
VAR
    
    verbe : string;
    rad : string;
    i,j :integer;

BEGIN
    
    rewrite(f);
    
    for i := 0 to 12 do
    BEGIN
        if t[i].gr = 1 then conjuguer1(t[i],f)
        else if t[i].gr = 2 then conjuguer2(t[i],f)
        //else conjuguer3(t[i].inf,f)
    END;
END;


VAR
    CListe : text;
    EListe : text;
    Vliste : text;
    Vtab : array[0..12] of verbe;
    i: integer;
    
BEGIN
    
    assign(CListe,'verbesconjuges.txt');
    assign(VListe,'verbes.txt');
    assign(Eliste,'exceptions.txt');
    remplir(VListe,EListe);
    determiner(Vtab,VListe,Eliste);
    
    for i := 0 to 12 do
    BEGIN
        write(Vtab[i].inf);
        write(Vtab[I].gr);
        writeln();
    END;
    
    conjuguer(Vtab,CListe); 
    
    readln();
    
END.
        

