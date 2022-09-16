function cfs --wraps='cf submit' --description 'alias cfs=cf submit'
  cf submit $argv; 
end
