# Module UI
  
#' @title   mod_help_ui and mod_help_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_help
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_help_ui <- function(id){
  ns <- NS(id)
  
  # customized action button to render well
  # in the tabbar
  help_bttn <- f7Button(
    inputId = ns("toggle_help"),
    fill = FALSE,
    label = "Help"
  )
  
  help_bttn[[2]]$name <- "a"
  help_bttn[[2]]$attribs$type <- NULL
  help_bttn[[2]]$attribs$class <- "tab-link sheet-open f7-action-button"
  help_bttn[[2]]$children <- NULL
  help_bttn[[2]] <- tagAppendChildren(
    help_bttn[[2]], 
    f7Icon("question_circle", old = FALSE),
    span(class = "tabbar-label", "Help")
  )
  
  # Part of the UI goes in the left panel
  # The button goes in the tabbar. We access each part
  # with mod_help_ui(id)[[1]] and mod_help_ui(id)[[2]],
  # respectively
  tagList(
    f7Panel(
      inputId = ns("help_panel"),
      title = "Help",
      side = "right",
      theme = "dark",
      effect = "reveal",
      resizable = FALSE,
      
      f7Accordion(
        multiCollapse = TRUE,
        inputId = ns("helpAccordion"),
        f7AccordionItem(
          title = "Welcome",
          "Welcome to deminR, the R version of the Minesweeper. 
          If you're a Windows' user, chances are that you had this game on 
          your computer a few years ago. This guide will help you in completing 
          your first game"
        ),
        f7AccordionItem(
          title = "Goal",
          "The goal is simple: flag all the mines as quick as 
          possible. You can start by clicking at an random place using use a 
          left click on desktop or a single tap on mobile or tablet. 
          It will reveal the block. The digits on a revealed block 
          indicates the number of adjacent mines around it. Put a 
          flag in a case when you think there is a mine. On desktop use a right 
          click, on mobile or tablet use a long tap (>1s).", 
          br(),
          div(img(src = 'www/img/rules1.png', alt = 'Example', width = '80', height = '80')) %>%
            f7Align("center")
        ),
        f7AccordionItem(
          title = "Details",
          "Above the grid, a timer shows your score, and a counter indicates 
          the number of remaining bombs in the grid. If you want to start over, 
          change the game level or refresh the scores table, hit the 'settings' 
          button. Happy deminR!"
        ),
        f7AccordionItem(
          title = "Loose",
          "If you reveal a block containing a mine, you loose.",
          br(),
          div(img(src = 'www/img/rules2.png', alt = 'Example', width = '80', height = '80')) %>%
            f7Align("center")
        ),
        f7AccordionItem(
          title = "Win",
          "If you manage to flag all the mines, you win and your score 
          is saved in the score panel!",
          br(),
          div(img(src = 'www/img/rules3.png', alt = 'Example', width = '80', height = '80')) %>%
            f7Align("center")
        )
      )
    ),
    help_bttn
  )
}
    
# Module Server
    
#' @rdname mod_help
#' @export
#' @keywords internal
    
mod_help_server <- function(input, output, session){
  ns <- session$ns
  # Help is located in the left panel
  observeEvent(input$toggle_help,{
    updateF7Panel(inputId = "help_panel", session = session)
    updateF7Accordion(inputId = "helpAccordion", selected = 1, session = session)
  })
}
    
## To be copied in the UI
# mod_help_ui("help_ui_1")
    
## To be copied in the server
# callModule(mod_help_server, "help_ui_1")
 
