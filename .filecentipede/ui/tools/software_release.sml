/*
 * fileu software_release
*/

#page_archive
{
    text:"${archive}"
    layout:VBoxLayout
    
    GridLayout
    {
        column:2
           
        "${name}: " HBoxLayout
        {
            LineEdit{
                name:name
                value:"filecxx"
            }
            "${version}: " DoubleSpinBox{
                name:version
                step:0.1
                min:0
                max:99999
                value:$filec-version()
            }
        }
        "${origin}:" PathEdit{
            mode:dir
            name:dir
            value:$fs-workspace()
        }
        "${output_directory}:" PathEdit#output_dir{
            mode:dir
            name:output_dir
        }
        "${ignore}: " TextEdit{
            name:ignore
"data_(.*).db
data_(.*).db-shm
data_(.*).db-wal
filesystem.db
filesystem.db-shm
filesystem.db-wal
fileu_(.*).conf
libicu.dat"
        }
    }
    HBoxLayout
    {
        Progress#page_archive_progress{
            min:0
            max:100
            value:0
            format:"%.2f%%"
            
        }
        <==>
        
        Button#btn_create_archive
        {
            text:"${create}"
            icon:"icons/16/export.svg"
        }
    }
}


Dialog#main
{
    title:"${software_release}"
    layout:VBoxLayout
    width:600
    height:400
    
    Tab
    {
        ${#page_archive}
    }
    

}
