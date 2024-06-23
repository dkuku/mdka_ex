#[rustler::nif]
fn from_html(html: &str) -> String {
    mdka::from_html(html)
}

rustler::init!("Elixir.MdkaEx.Native", [from_html]);
