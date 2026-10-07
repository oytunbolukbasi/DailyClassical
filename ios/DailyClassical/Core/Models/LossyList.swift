import Foundation

/// A JSON array decoded element by element: an element this build can't decode (a shape added on
/// the server after the app shipped) is skipped instead of failing the whole response. Content
/// ships without app updates, so list endpoints must degrade one item at a time.
nonisolated struct LossyList<Element: Decodable & Sendable>: Decodable, Sendable {
    let elements: [Element]

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var elements: [Element] = []
        while !container.isAtEnd {
            if let element = try? container.decode(Element.self) {
                elements.append(element)
            } else {
                _ = try? container.decode(Skip.self)  // advance past the element we couldn't read
            }
        }
        self.elements = elements
    }

    private struct Skip: Decodable {}
}
