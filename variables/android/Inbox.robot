*** Variables ***

# INBOX
${Inbox_icon}                            ${APP_PACKAGE}:id/iv_dashboard_inbox

${Inbox_ListView}                        ${APP_PACKAGE}:id/nestedscrollview
${Inbox_Place_display_Transaction}       ${APP_PACKAGE}:id/rv_inbox_trans
${Inbox_Edit}                            ${APP_PACKAGE}:id/tv_edit
${Inbox_Done}                            ${APP_PACKAGE}:id/tv_edit
${Inbox_SelectAll}                       ${APP_PACKAGE}:id/checkbox_selectAll
${Inbox_List_CheckBox}                   ${APP_PACKAGE}:id/checkbox_selection

${Inbox_Promo_back}                      ${APP_PACKAGE}:id/ib_backButton
${Inbox_Promo_Edit}                      ${APP_PACKAGE}:id/tv_rightButton
${Inbox_Promo_Done}                      ${APP_PACKAGE}:id/tv_rightButton

${Inbox_Notify_Done}                      ${APP_PACKAGE}:id/tv_rightButton
${Inbox_Notify_Edit}                      ${APP_PACKAGE}:id/tv_rightButton
${Inbox_Notify_back}                     ${APP_PACKAGE}:id/ib_backButton

${Inbox_Transaction_Buy}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[5]/android.view.View[1]
${Inbox_Transaction_Close}               ${APP_PACKAGE}:id/ib_backButton

${Inbox_Date}                             16 July 2021 
${promo_icon}                            ${APP_PACKAGE}:id/iv_icon
${Notify_icon}                           ${APP_PACKAGE}:id/iv_icon

${mark_read}                            ${APP_PACKAGE}:id/btn_markAsRead
${bt_delete}                            ${APP_PACKAGE}:id/btn_delete

${checkbox_notify_1.1}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/android.widget.RelativeLayout/android.widget.CheckBox
${checkbox_notify_1.2}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[2]/android.widget.RelativeLayout/android.widget.CheckBox
# ${nested_scroll_view}                   //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout
# ${item_2}                               //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]
${checkbox_notify_1.1'}                   //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.CheckBox
# ${checkbox_notify_1.2}                   ${APP_PACKAGE}:id/checkbox_selection
${checkbox_notify_2.1}                    //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.LinearLayout[1]/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.CheckBox
${detail_notify}                        ${APP_PACKAGE}:id/titleInboxTrans
${detail_notify_header}                 ${APP_PACKAGE}:id/tv_headerTitle
${detail_notify_image}                  //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.widget.Image
${detail_notify_descrip}                //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.view.View[4]

${checkbox_transaction_1.1}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[1]/android.widget.RelativeLayout/android.widget.CheckBox
${checkbox_transaction_1.2}              //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout[2]/android.widget.RelativeLayout/android.widget.CheckBox
${checkbox_transaction_1.1'}             //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.CheckBox
${checkbox_transaction_2.1}              /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[2]/androidx.recyclerview.widget.RecyclerView/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.CheckBox
${detail_transaction_header}            ${APP_PACKAGE}:id/tv_headerTitle     
${detail_trans}                        ${APP_PACKAGE}:id/titleInboxTrans 
${trans_icon}                        //hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.widget.RelativeLayout/android.webkit.WebView/android.webkit.WebView/android.widget.Image
