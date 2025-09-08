InputDialog#move_file
{
    mode:text
    width:500
    title:"${move_to}"
    label:"${remote_path}/${file_name}"
    
}


Alert#delete_file
{
    icon:question
    title:"${delete_file}"
    text:"${delete_file_alert}"
    
    {
        value:1
        text:"${OK}"
    }
    {
        value:0
        text:"${cancel}"
    }
} 
