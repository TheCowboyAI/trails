use leptos::prelude::*;

#[component]
pub fn HumanInput() -> impl IntoView {
    view! {
        <div class="human-input">
            <input class="typing" type="text" placeholder="Ask a question..."/>
            <input class="button" type="submit" value="Ask"/>
        </div>
    }
}
