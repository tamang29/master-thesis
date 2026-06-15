#let section-link(target) = context {
  let element = query(target).first()
  link(
    element.location(),
    [Section #numbering(
      element.numbering,
      ..counter(heading).at(element.location())
    )]
  )
}
