class ListalibroController < ApplicationController
  def index
    @libro = Libro.all
  end
end
