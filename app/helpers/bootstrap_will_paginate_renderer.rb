class BootstrapWillPaginateRenderer < WillPaginate::ActionView::LinkRenderer
  protected

  def html_container(html)
    tag(:nav, tag(:ul, html, class: 'pagination justify-content-center')) # Center pagination links
  end

  def page_number(page)
    if page == current_page
      tag(:li, link(page, page, class: 'page-link'), class: 'page-item active')
    else
      tag(:li, link(page, page, class: 'page-link'), class: 'page-item')
    end
  end

  def previous_or_next_page(page, text, classname)
    if page
      tag(:li, link(text.include?('Next') ? '<i class="fa-solid fa-chevron-right"></i>' : '<i class="fa-solid fa-chevron-left"></i>', page, class: 'page-link'), class: "page-item #{classname}")
    else
      tag(:li, link(text.include?('Next') ? '<i class="fa-solid fa-chevron-right"></i>' : '<i class="fa-solid fa-chevron-left"></i>', '#', class: 'page-link'), class: "page-item disabled")
    end
  end
end