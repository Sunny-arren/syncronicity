json.array! @jpcities do |jpcity|
  json.id jpcity.id
  json.jpkanji jpcity.jpkanji
  json.hira jpcity.hira
  json.simplified jpcity.simplified
  json.alphabet jpcity.alphabet
end