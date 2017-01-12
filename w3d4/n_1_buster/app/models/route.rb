class Route < ActiveRecord::Base
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query

    buses_w_drivers = buses.includes(:drivers)

    all_drivers = {}

    buses_w_drivers.each do |bus|
      current_bus_roster = bus.drivers.inject([]) do |roster, driver|
        roster << driver.name
      end
      all_drivers[bus.id] = current_bus_roster
    end

    all_drivers

  end
end
