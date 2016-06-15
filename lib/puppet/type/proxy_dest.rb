Puppet::Type.newtype :proxy_dest, :is_capability => true do
  param :name, :is_namevar => true
  param :host
  param :port
end
