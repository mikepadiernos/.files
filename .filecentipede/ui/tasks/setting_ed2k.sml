
VBoxLayout#ed2k
{
    ComboBox#ed2k_uri{
        size-adjust:minimum
    }
    
    GridLayout
    {
        column:2
        
        "${file_name}:"
        HBoxLayout
        {
            LineEdit{
                name:file_name
            }
            
            "${catalog}:" ComboBox#ed2k_catalog{
                name:catalog
                vtype:text
                editable:false
                {text:"  ---  ",data:""}
            }
        }
        
        "${save_path}:" HBoxLayout
        {
            ComboBox#ed2k_save_path
            {
                name:save_path
                editable:true
                stretch:"expand"
                vtype:text
            }
            Button{
                text:"..."
                click: $select-dir("${save_path}",${#ed2k_save_path})
            }
        }
    }
    <==>
} 
