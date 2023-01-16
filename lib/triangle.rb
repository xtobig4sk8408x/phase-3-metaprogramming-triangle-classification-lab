class Triangle
  attr_accessor :equilateral, :isosceles, :scalene 
  attr_reader :side1, :side2, :side3 

  def initialize(side1, side2, side3)
    @side1 = side1    
    @side2 = side2    
    @side3 = side3
  end

  def kind 
    validate_triangle 
    if side1= side2 && side2 = side3
      :equilateral 
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles 
    else 
      :scalene 
    end
  end 

  def greater_than_zero? 
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_inequalities? 
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end
  
  def validate_triangle 
    raise TriangleError unless greater_than_zero? && valid_inequalities?  
  end

  class TriangleError < StandardError 
  end
end
