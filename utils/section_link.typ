#let section-link(target) = context {
  let element = query(target).first()
  let location = element.location()
  link(
    location.position(),
    [Section #numbering(
      element.numbering,
      ..counter(heading).at(location)
    )]
  )
}
