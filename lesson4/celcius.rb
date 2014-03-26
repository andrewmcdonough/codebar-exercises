class Celcius

  def initialize(temperature)
    @temperature = temperature
  end

  def to_s
    "#{@temperature.round} degrees C"
  end

  def to_fahrenheit
    (@temperature*1.8 + 32).round
  end 

  def to_fahrenheit_s
    "#{to_fahrenheit} degrees F"
  end 

end

temperatures = {}
%w(Mon Tue Wed Thu Fri Sat Sun).each do |day|
  print "Temperature for #{day}: "
  t = gets.strip
  temperatures[day] = Celcius.new(t.to_f)
end

temperatures.each_pair do |day, temperature|
  puts "#{day} | #{temperature.to_s} | #{temperature.to_fahrenheit_s}"
end
