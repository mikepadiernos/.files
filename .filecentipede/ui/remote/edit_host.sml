Dialog#main
{
    title:"${host}"
    min-width:300
    layout:VBoxLayout
    
    GroupBox
    {
        title:"${settings}"
        layout:{
            type:GridLayout
            column:2
        }
        "${name}: " LineEdit{
            name:name
            placeholder:"${optional}"
        }
        "${host}:" LineEdit{
            name:host
            test:nonempty
            placeholder:"IP/${domain}"
        }
        "${port}:" SpinBox{
            name:port
            value:10111
            min:0
            max:65535
           
        }
    }

    HBoxLayout
    {
        <==>
        Button#add{
            text:"${add}"
            click:$filec-submit("remote_client_add",${#main},"close")
        }
        Button#cancel{
            click:$close{#main}()
            text:"${cancel}"
        }
    }
}
