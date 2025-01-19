pub mod modules;

#[cfg(feature = "hydrate")]
#[wasm_bindgen::prelude::wasm_bindgen]
pub fn hydrate() {
    use crate::modules::app::App;
    console_error_panic_hook::set_once();
    leptos::mount::hydrate_body(App);
}
