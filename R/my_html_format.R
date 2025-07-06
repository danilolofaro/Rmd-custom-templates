#' Custom HTML template
#'
#' Loads additional style and template file
#'
#' @param toc should a table of contents be displayed?
#' @param ... additional arguments provided to \@code{html_document}
#' @export
#'
my_html_format = function(toc = TRUE, ...) {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "MyReports")
  }

  css    = pkg_resource("rmarkdown/resources/styles.css")
  header = pkg_resource("rmarkdown/resources/header.html")
  footer = pkg_resource("rmarkdown/resources/footer.html")

  # call the base html_document function
  rmarkdown::html_document(
    toc = toc,
    toc_float = TRUE,
    fig_width = 8,
    fig_height = 6,
    theme = "lumen",
    code_folding = "show",
    css = css,
    number_sections = TRUE,
    includes = rmarkdown::includes(before_body = header, after_body = footer),
    ...
  )
}
