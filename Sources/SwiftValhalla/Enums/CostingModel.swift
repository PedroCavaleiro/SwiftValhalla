//
//  CostingModels.swift
//  SwiftValhalla
//
//  Created by Pedro Cavaleiro on 19/08/2025.
//

import Foundation

/// Run-time costing model for route path generation.
public enum CostingModel: String, Codable, Sendable {
    /// Standard costing for driving routes by car, motorcycle, truck, and so on that obeys automobile driving rules, such as access and turn restrictions. Auto provides a short time path (though not guaranteed to be shortest time) and uses intersection costing to minimize turns and maneuvers or road name changes. Routes also tend to favor highways and higher classification roads, such as motorways and trunks.
    case auto = "auto"
    /// Standard costing for travel by bicycle, with a slight preference for using cycleways or roads with bicycle lanes. Bicycle routes follow regular roads when needed, but avoid roads without bicycle access.
    case bicycle = "bicycle"
    /// Standard walking route that excludes roads without pedestrian access. In general, pedestrian routes are shortest distance with the following exceptions: walkways and footpaths are slightly favored, while steps or stairs and alleys are slightly avoided.
    case pedestrian = "pedestrian"
    /// Standard costing for bus routes. Bus costing inherits the auto costing behaviors, but checks for bus access on the roads.
    case bus = "bus"
    /// A combination of pedestrian and bicycle. Use bike share station(amenity:bicycle_rental) to change the travel mode
    /// - Note: This model is still in BETA
    case bikeshare = "bikeshare"
    /// Standard costing for trucks. Truck costing inherits the auto costing behaviors, but checks for truck access, width and height restrictions, and weight limits on the roads.
    case truck = "truck"
    @available(*, deprecated, renamed: "auto")
    case hov = "hov"
    /// Standard costing for taxi routes. Taxi costing inherits the auto costing behaviors, but checks for taxi lane access on the roads and favors those roads.
    case taxi = "taxi"
    /// Standard costing for travel by motor scooter or moped. By default, motor_scooter costing will avoid higher class roads unless the country overrides allows motor scooters on these roads. Motor scooter routes follow regular roads when needed, but avoid roads without motor_scooter, moped, or mofa access.
    case motorScooter = "motor_scooter"
    /// Standard costing for travel by motorcycle. This costing model provides options to tune the route to take roadways (road touring) vs. tracks and trails (adventure motorcycling).
    /// - Note: This model is still in BETA
    case motorcycle = "motorcycle"
    /// Currently supports pedestrian and transit. In the future, multimodal will support a combination of all of the above.
    case multiModal = "multi_modal"
}
