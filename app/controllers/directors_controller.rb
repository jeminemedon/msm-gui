class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def create
    director = Director.new
    director.name = params.fetch("query_name")
    director.image = params.fetch("query_image")
    director.dob = params.fetch("query_dob")
    director.bio = params.fetch("query_bio")
  
    director.save
    redirect_to("/directors")
  end
  
  def update
    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)
  
    director.name = params.fetch("query_name")
    director.image = params.fetch("query_image")
    director.dob = params.fetch("query_dob")
    director.bio = params.fetch("query_bio")
  
    director.save
    redirect_to("/directors/#{director.id}")
  end
  
  def destroy
    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)
  
    director.destroy
    redirect_to("/directors")
  end

  def update
    director_id = params.fetch("path_id")
    director = Director.where({ :id => director_id }).at(0)
  
    director.name = params.fetch("query_name")
    director.image = params.fetch("query_image")
    director.dob = params.fetch("query_dob")
    director.bio = params.fetch("query_bio")
  
    director.save
    redirect_to("/directors/#{director.id}")
  end
  
  
end
