set target_docking_port to ship:partstagged("main docking port")[0].
set docking_module to target_docking_port:getmodule("ModuleDockingNode").

lock mapped_force to ship:control:pilotmainthrottle * 200. // maps pilot input (0.00 to 1.00) to acquire force (0 to 200).

until false {
    docking_module:setfield("docking acquire force", mapped_force).
    wait 0.1.
}