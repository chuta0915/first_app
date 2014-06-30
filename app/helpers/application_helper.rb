module ApplicationHelper

   # $B%Z!<%8$4$H$N40A4$J%?%$%H%k$rJV$7$^$9!#(B# $B%3%a%s%H9T(B
  def full_title(page_title)                          # $B%a%=%C%IDj5A(B
    base_title = "Ruby on Rails Tutorial Sample App"  # $BJQ?t$KCM$r3d$jEv$F$k(B
    if page_title.empty?                              # $BO@M}CM%F%9%H(B
      base_title                                      # $B0EL[$NJV$jCM(B
    else
      "#{base_title} | #{page_title}"                 # $BJ8;zNs$N<0E83+(B
    end
  end
                                   
end
