
Dialog#main
{
    title:"${translate_files}"
    layout:VBoxLayout
    min-width:400
    
    Tab#tab
    {
        #file_widget
        {
            text:"${files}"
            layout:GridLayout
            
            "${language}:" PathEdit
            {
                name:language
                mode:file
                filter:"*.lang"
            }
            "${path}:" PathEdit
            {
                name:path
                mode:file
            }
            "${save_path}:" PathEdit
            {
                name:save_path
                mode:save
            }
        }
        #directory_widget
        {
            text:"${directory}"
            layout:GridLayout
            
            "${language}:" PathEdit
            {
                name:language
                mode:file
                filter:"*.lang"
            }
            "${path}:" PathEdit
            {
                name:path
                mode:dir
            }
            "${save_path}:" PathEdit
            {
                name:save_path
                mode:dir
            }
        }
        #auto_directory_widget
        {
            text:"${auto_create_directories}"
            layout:VBoxLayout
            
            GridLayout
            {
                "${languages}:" PathEdit
                {
                    name:languages
                    mode:dir
                }
                "${path}:" PathEdit
                {
                    name:path
                    mode:dir
                }
            }
            Label{
                css:"color:gray"
                text:"${translate_auto_directories_text_}"
            }
        }
    }
    
    HBoxLayout
    {
        <==>
        Button#translate{
            text:"${translate}"
        }
        Button{
            text:"${cancel}"
            click:$close{#main}()
        }
    }
} 
