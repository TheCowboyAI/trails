use leptos::prelude::*;

use crate::modules::{
    history::{History, HistoryItem},
    humaninput::HumanInput,
};

#[component]
pub fn HomePage() -> impl IntoView {
    view! {
        <div class="underlay">
            <div class="container">
                <History>
                    <HistoryItem actor="system".to_string() msg="I did something".to_string() />
                </History>
                <HumanInput/>
            </div>
        </div>
    }
}
