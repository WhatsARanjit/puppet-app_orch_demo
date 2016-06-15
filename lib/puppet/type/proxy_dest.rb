Puppet::Type.newtype :proxy_dest, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :host
  newparam :port
end
