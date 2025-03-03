Dialog#main
{
    title:"${base64} ${encode} / ${decode}"
    layout:VBoxLayout
    w:600
    h:400
    
    "${source}:" TextEdit#source{}
    "${encoded}:" TextEdit#encoded{}
    
    HBoxLayout
    {
        <==>
        Button{
            text:"${encode}"
            icon:"icons/16/lock.svg"
            click:$base64-encode(${#source},${#encoded})
        }
        Button{
            text:"${decode}"
            icon:"icons/16/unlock.svg"
            click:$base64-decode(${#encoded},${#source})
        }
    }
}


