use leptos::prelude::*;

#[component]
pub fn History(children: ChildrenFn) -> impl IntoView {
    view! {
        <div class="history">
            {children()}
        </div>
    }
}

#[component]
pub fn HistoryItem(actor: String, msg: String) -> impl IntoView {
    view! {
        <div class=["history-item", {actor.as_str()}].join(" ")>
            <h3>{actor.clone()}: </h3>
            <p>{msg}</p>
        </div>
    }
}
