# 1
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

# 2
def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

# 3 and 4
def add_or_remove_cash(pet_shop, amount_being_added_or_removed)
  return pet_shop[:admin][:total_cash] += amount_being_added_or_removed
end

# 5
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

# 6
def increase_pets_sold(pet_shop, number_of_pets_added)
  pet_shop[:admin][:pets_sold] += number_of_pets_added
end

# 7
def stock_count(pet_shop)
  return pet_shop[:pets].count
end

# 8 and 9
def pets_by_breed(pet_shop, pet_breed)
  count = []
  for pet in pet_shop[:pets]
    if pet[:breed] == pet_breed
      count << 1
    end
  end
  return count
end

# 10 and 11
def find_pet_by_name(pet_shop, pet_we_are_looking_for)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_we_are_looking_for
      return pet
    end
  end
  return nil
end

# 12
def remove_pet_by_name(pet_shop, animal_name)
  for each_pet in pet_shop[:pets]
    if each_pet[:name] == animal_name
      pet_shop[:pets].delete(each_pet)
    end
  end
end

# 13
def add_pet_to_stock(pet_shop, pet_being_added)
  return pet_shop[:pets] << pet_being_added
end

# 14
def customer_cash(customers)
  return customers[:cash]
end

# 15
def remove_customer_cash(customer, amount_to_be_removed)
  customer[:cash] -= amount_to_be_removed
end

# 16
def customer_pet_count(customer)
  return customer[:pets].count
end

# 17
def add_pet_to_customer(customer, a_new_pet)
  customer[:pets]<< a_new_pet
end

# 18, 19, 20
def customer_can_afford_pet(customer, a_new_pet)
  if customer[:cash] === a_new_pet[:price]
    return true
  elsif
    customer[:cash] >= a_new_pet[:price]
    return true
  else
    return false
  end
end

# 21, 22, 23
def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil
    return
  end
  if customer_can_afford_pet(customer, pet) == false
    return
  end

  add_pet_to_customer(customer, pet)
  increase_pets_sold(pet_shop, 1)
  remove_customer_cash(customer, pet[:price])
  add_or_remove_cash(pet_shop, pet[:price])
end
