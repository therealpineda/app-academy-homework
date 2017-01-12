class House < ActiveRecord::Base
  has_many(
    :gardeners,
    class_name: "Gardener",
    foreign_key: :house_id,
    primary_key: :id
  )

  has_many(
    :plants,
    through: :gardeners,
    source: :plants
  )

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    # TODO: your code here
    # create an array of all the seeds within a given house

    # This is 3 SQL queries...
    plants_w_seeds = plants.includes(:seeds)

    # Why doesn't this work?
    # plants_w_seeds = plants
    #   .select('seeds.*')
    #   .join(:seeds)

    seeds = []
    plants_w_seeds.each do |plant|
      seeds << plant.seeds
    end
    seeds

  end
end
