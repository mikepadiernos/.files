return {
    "jdrupal-dev/drupal.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        ,}
    },
    config = function()
    require("drupal").setup({
        services_cmp_trigger_character = "@",
        get_drush_executable = function(current_dir)
            -- You can use current_dir if you have different ways of
            -- executing drush across your Drupal projects.
            return "drush"
        end,
    })
    end
}
