# Nushell Config File
#
# version = 0.78.1

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
let dark_theme = {
    separator: "#a9b1d6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#9ece6a" attr: "b" }
    empty: "#7aa2f7"
    bool: {|| if $in { "#7dcfff" } else { "light_gray" } }
    int: "#a9b1d6"
    filesize: {|e|
      if $e == 0b {
        "#a9b1d6"
      } else if $e < 1mb {
        "#7dcfff"
      } else {{ fg: "#7aa2f7" }}
    }
    duration: "#a9b1d6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f7768e" attr: "b" }
      } else if $in < 6hr {
        "#f7768e"
      } else if $in < 1day {
        "#e0af68"
      } else if $in < 3day {
        "#9ece6a"
      } else if $in < 1wk {
        { fg: "#9ece6a" attr: "b" }
      } else if $in < 6wk {
        "#7dcfff"
      } else if $in < 52wk {
        "#7aa2f7"
      } else { "dark_gray" }
    }
    range: "#a9b1d6"
    float: "#a9b1d6"
    string: "#a9b1d6"
    nothing: "#a9b1d6"
    binary: "#a9b1d6"
    cellpath: "#a9b1d6"
    row_index: { fg: "#9ece6a" attr: "b" }
    record: "#a9b1d6"
    list: "#a9b1d6"
    block: "#a9b1d6"
    hints: "dark_gray"

    shape_and: { fg: "#bb9af7" attr: "b" }
    shape_binary: { fg: "#bb9af7" attr: "b" }
    shape_block: { fg: "#7aa2f7" attr: "b" }
    shape_bool: "#7dcfff"
    shape_closure: "#9ece6a"
    shape_custom: "#9ece6a"
    shape_datetime: { fg: "#7dcfff" attr: "b" }
    shape_directory: "#7dcfff"
    shape_external: "#7dcfff"
    shape_externalarg: { fg: "#9ece6a" attr: "b" }
    shape_filepath: "#7dcfff"
    shape_flag: { fg: "#7aa2f7" attr: "b" }
    shape_float: { fg: "#bb9af7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7dcfff" attr: "b" }
    shape_int: { fg: "#bb9af7" attr: "b" }
    shape_internalcall: { fg: "#7dcfff" attr: "b" }
    shape_list: { fg: "#7dcfff" attr: "b" }
    shape_literal: "#7aa2f7"
    shape_match_pattern: "#9ece6a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7dcfff"
    shape_operator: "#e0af68"
    shape_or: { fg: "#bb9af7" attr: "b" }
    shape_pipe: { fg: "#bb9af7" attr: "b" }
    shape_range: { fg: "#e0af68" attr: "b" }
    shape_record: { fg: "#7dcfff" attr: "b" }
    shape_redirection: { fg: "#bb9af7" attr: "b" }
    shape_signature: { fg: "#9ece6a" attr: "b" }
    shape_string: "#9ece6a"
    shape_string_interpolation: { fg: "#7dcfff" attr: "b" }
    shape_table: { fg: "#7aa2f7" attr: "b" }
    shape_variable: "#bb9af7"
    shape_vardecl: "#bb9af7"

    background: "#24283b"
    foreground: "#c0caf5"
    cursor: "#c0caf5"
}

# External completer example
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell $spans | from json
# }


# The default config record. This is where much of your global configuration is setup.
let-env config = {
  # true or false to enable or disable the welcome banner at startup
  show_banner: false
  ls: {
    use_ls_colors: true # use the LS_COLORS environment variable to colorize output
    clickable_links: true # enable or disable clickable links. Your terminal has to support links.
  }
  rm: {
    always_trash: true # always act as if -t was given. Can be overridden with -p
  }
  cd: {
    abbreviations: false # allows `cd s/o/f` to expand to `cd some/other/folder`
  }
  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    show_empty: true # show 'empty list' and 'empty record' placeholders for command output
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
  }

  history: {
    max_size: 10000 # Session has to be reloaded for this to take effect
    sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
  }
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true  # set this to false to prevent auto-selecting completions when only one remains
    partial: true  # set this to false to prevent partial filling of the prompt
    algorithm: "prefix"  # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: null # check 'carapace_completer' above as an example
    }
  }
  filesize: {
    metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
  }
  cursor_shape: {
    emacs: block # block, underscore, line (line is the default)
  }
  color_config: $dark_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  # buffer_editor: "emacs" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  use_ansi_coloring: true
  edit_mode: emacs # emacs, vi
  shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.

  hooks: {
    pre_prompt: [{||
      null  # replace with source code to run before the prompt is shown
    }]
    pre_execution: [{||
      null  # replace with source code to run before the repl input is run
    }]
    env_change: {
      PWD: [{|before, after|
        null  # replace with source code to run if the PWD environment is different since the last repl input
      }]
    }
    display_output: {||
      if (term size).columns >= 100 { table -e } else { table }
    }
    command_not_found: {||
      null  # replace with source code to return an error message when a command is not found
    }
  }
  menus: [
      # Configuration for default nushell menus
      # Note the lack of source parameter
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      # Example of extra menus created using a nushell source
      # Use the source field to create a list of records that populates
      # the menu
      {
        name: commands_menu
        only_buffer_difference: false
        marker: "# "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.vars
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
  ]
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
      event: { send: menuprevious }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: emacs
      event: { send: menu name: history_menu }
    }
    {
      name: unix-line-discard
      modifier: control
      keycode: char_u
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cutfromlinestart}
        ]
      }
    }
    {
      name: kill-line
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cuttolineend}
        ]
      }
    }
    # Keybindings used to trigger the user defined menus
    {
      name: commands_menu
      modifier: control
      keycode: char_t
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_menu }
    }
    {
      name: vars_menu
      modifier: alt
      keycode: char_o
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: vars_menu }
    }
    {
      name: commands_with_description
      modifier: control
      keycode: char_s
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_with_description }
    }
  ]
}

source ~/.cache/starship/init.nu
source ~/.zoxide.nu
source ~/nuscripts/init.nu
