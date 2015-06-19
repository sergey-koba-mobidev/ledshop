module ApplicationHelper
  def roundup(num)
    x = Math.log10(num).floor
    (num/(10.0**x)).ceil * 10**x
  end

  def current_controller?(*ctrl_names)
    ctrl_names.include?(params[:controller])
  end

  def current_action?(*action_names)
    action_names.include?(params[:action])
  end

  def current_taxon?(*taxon_names)
    return false if params[:id].nil?
    taxon_names.include?(params[:id])
  end

  def render_snippet(slug)
    page = Spree::Page.find_by_slug(slug)
    raw page.body if page
  end
end
