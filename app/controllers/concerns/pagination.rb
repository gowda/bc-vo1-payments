# frozen_string_literal: true

module Pagination
  extend ActiveSupport::Concern

  def current_page
    Integer(params[:page])
  rescue ArgumentError, TypeError
    1
  end

  def current_per_page
    Integer(params[:per_page])
  rescue ArgumentError, TypeError
    20
  end

  def page_options(page)
    return { page: page } if params[:per_page].nil?

    {
      page: page,
      per_page: params[:per_page]
    }
  end

  def page_url(page)
    url_for(**page_options(page))
  end
  alias last_page_url page_url

  def next_page_url
    page_url(current_page + 1)
  end

  def prev_page_url
    page_url(current_page - 1)
  end

  def first_page_url
    page_url(1)
  end

  def first_page_link_header(collection)
    <<~FIRST_PAGE_LINKS.gsub(/\n/, ' ').strip
      <#{next_page_url}>;
      rel="next",
      <#{last_page_url(collection.total_pages)}>;
      rel="last"
    FIRST_PAGE_LINKS
  end

  def last_page_link_header(_collection)
    <<~LAST_PAGE_LINKS.gsub(/\n/, ' ').strip
      <#{prev_page_url}>;
      rel="prev",
      <#{first_page_url}>;
      rel="first"
    LAST_PAGE_LINKS
  end

  def page_link_header(collection)
    <<~PAGE_LINKS.gsub(/\n/, ' ').strip
      <#{prev_page_url}>;
      rel="prev",
      <#{next_page_url}>;
      rel="next",
      <#{last_page_url(collection.total_pages)}>;
      rel="last",
      <#{first_page_url}>;
      rel="first"
    PAGE_LINKS
  end

  def link_header(collection)
    return last_page_link_header(collection) if collection.last_page?
    return first_page_link_header(collection) if collection.first_page?

    page_link_header(collection)
  end
end
