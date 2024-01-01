
public func rubberBand(value: Double, min: Double, max: Double, bandLength: Double)
  -> Double
{
  if value >= min && value <= max {
    // While we're within range we don't rubber band the value.
    return value
  }

  if bandLength <= 0 {
    // The rubber band doesn't exist, return the minimum value so that we stay put.
    return min
  }

  let rubberBandCoefficient: Double = 0.55
  // Accepts values from [0...+inf and ensures that f(x) < bandLength for all values.
  let band: (Double) -> Double = { value in
    let demoninator = value * rubberBandCoefficient / bandLength + 1
    return bandLength * (1 - 1 / demoninator)
  }
  if value > max {
    return band(value - max) + max

  } else if value < min {
    return min - band(min - value)
  }

  return value
}
