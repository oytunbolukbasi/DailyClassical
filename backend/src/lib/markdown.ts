/**
 * The small markdown subset the legal pages use (backend/legal/*.md): "# " and "## " headings,
 * paragraphs, "- " lists, **bold** and [links](url). Text is HTML-escaped before inline marks are
 * applied, so the source can never inject markup.
 */
const esc = (s: string) => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");

function inline(text: string): string {
  return esc(text)
    .replace(/\*\*(.+?)\*\*/g, "<strong>$1</strong>")
    .replace(/\[([^\]]+)\]\(((?:https?:\/\/|mailto:)[^)\s]+)\)/g, '<a href="$2">$1</a>');
}

export function renderMarkdown(source: string): string {
  const html: string[] = [];
  let list: string[] = [];
  let para: string[] = [];
  const flush = () => {
    if (para.length) html.push(`<p>${inline(para.join(" "))}</p>`);
    if (list.length) html.push(`<ul>${list.map((li) => `<li>${inline(li)}</li>`).join("")}</ul>`);
    para = [];
    list = [];
  };
  for (const raw of source.replace(/\r\n/g, "\n").split("\n")) {
    const line = raw.trim();
    if (!line) { flush(); continue; }
    const heading = line.match(/^(#{1,2})\s+(.*)$/);
    if (heading) {
      flush();
      const level = heading[1]!.length;
      html.push(`<h${level}>${inline(heading[2]!)}</h${level}>`);
    } else if (line.startsWith("- ")) {
      if (para.length) flush();
      list.push(line.slice(2));
    } else {
      if (list.length) flush();
      para.push(line);
    }
  }
  flush();
  return html.join("\n");
}
