set target_docking_ports to ship:partstagged("throttled"). // tag whichever ports you want to have throttle control over

set docking_port_modules to list(). // list of all docking ports' partModules
for port in target_docking_ports {
    docking_port_modules.add(port:getmodule("ModuleDockingNode")).
}

lock mapped_force to ship:control:pilotmainthrottle * 200. // maps pilot input (0.00 to 1.00) to acquire force (0 to 200)

until false {
    for module in docking_port_modules {
        module:setfield("docking acquire force", mapped_force).
    }
    wait 0.1.
}