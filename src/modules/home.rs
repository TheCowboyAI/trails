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
                <HistoryItem actor="system".to_string() msg="Instructions sent".to_string() />
                <HistoryItem actor="ai".to_string() msg="I read some instructions".to_string() />
                <HistoryItem actor="human".to_string() msg="I asked a question".to_string() />
                <HistoryItem actor="system".to_string() msg="You attached a file".to_string() />
                <HistoryItem actor="human".to_string() msg="I ask for a summary".to_string() />
                </History>
                <HumanInput/>
            </div>
        </div>
    }
}
