Dialog#main
{
    title:"User Agent"
    width:700
    height:400
    layout:VBoxLayout
    
    TextEdit{
        name:text
    }
    HBoxLayout
    {
        <==>
        Button#save{
            text:"${save}"
            icon:"icons/16/save.svg"
        }
        Button{
            text:"${cancel}"
            click:$close{#main}()
        }
    }
} 
