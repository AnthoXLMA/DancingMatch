module DancesHelper
  def dances_for_select
    Dance.all.collect { |m| [m.title, m.id] }
  end
end
