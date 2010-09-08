Factory.define :starship do |s|
  s.name 'test'
  s.x_pos 0
  s.y_pos 0
  s.speed 1
end

Factory.define :travel do |t|
  t.x_start 0
  t.y_start 0
  t.x_dest 50
  t.y_dest 50
  t.speed 1
end

Factory.define :user do |u|
  u.username 'test'
  u.email 'test@example.com'
  u.password 'password'
  u.password_confirmation 'password'
  u.association :starship
end

Factory.define :planet do
end
