Dialog#main
{
    title:"${create_file}"
    layout:VBoxLayout
    w:400
    h:100
    
    "${name}:" LineEdit#name{
    
    }
    HBoxLayout
    {
        <==>
        Button#ok{
            text:"${OK}"
        }
        Button{
            text:"${cancel}"
            click:$close{#main}()
        }
    }
}
 
