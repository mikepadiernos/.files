Dialog#main
{
    title:"${authentication}"
    icon:"icons/24/notifications.svg"
    width:300
    height:100
    layout:VBoxLayout
    
    HBoxLayout
    {
        Img{
            fixed-width:24
            fixed-height:24
            "icons/24/notifications.svg"
        }
        Label#message{
            class:list_title
            css:"font-weight: bold"
        }
    }
    GridLayout
    {
        "${address}: " LineView#address{
            css:"font-weight: bold"
        }
        "${user}:" LineEdit{
            name:user
        }
        "${password}: " LineEdit{
            type:password
            name:pass
        }
    }
    HBoxLayout
    {
        CheckBox{
            name:save
            text:"${save_password}"
        }
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
 
