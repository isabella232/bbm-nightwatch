module ApplicationHelper
  def page_title
    [content_for(:title), t('page_title')].compact.join(' - ')
  end

  def bootstrap_class_for flash_type
    case flash_type.to_s
    when "success"
      "alert-success"
    when "error"
      "alert-warning"
    when "alert"
      "alert-danger"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end

  def available(from, to)
    if from.beginning_of_day == to.beginning_of_day
      t 'donations.cards.available_single_day', date: from.strftime('%F'), from: from.strftime('%H:%M'), to: to.strftime('%H:%M')
    else
      t 'donations.cards.available_different_days', from: from.strftime('%F %H:%M'), to: to.strftime('%F %H:%M')
    end
  end
end
