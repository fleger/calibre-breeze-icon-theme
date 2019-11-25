#! /bin/bash

# Calibre Breeze Icon Theme Build Script
# Requires calibre, breeze-icons, optipng and librsvg

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

: ${CALIBRE_RESOURCES_PATH:=/usr/share/calibre}
: ${BREEZE_ICONS_PATH:=/usr/share/icons/breeze}

BREEZE_EXT=.svg
CALIBRE_EXT=.png
CALIBRE_ICON_SIZE=128

OUTPUT_DIR=resources/images

declare -A mappings=(
    ['add_book']="actions/22/journal-new"
    ['apple-touch-icon']=
    ['arrow-down']="actions/22/arrow-down"
    ['arrow-up']="actions/22/arrow-up"
    ['auto_author_sort']="actions/22/sort-name"
    ['auto-reload']="actions/22/view-refresh"
    ['back']="actions/22/go-previous"
    ['beautify']="actions/22/flower-shape"
    ['blank']=
    ['bookmarks']="actions/22/bookmarks"
    ['book']="actions/22/address-book-new"
    ['books_in_series']="actions/22/view-file-columns"
    ['catalog']="actions/22/view-catalog"
    ['chapters']="actions/22/format-list-ordered"
    ['character-set']="actions/22/format-text-symbol"
    ['clear_left']="actions/22/edit-clear"
    ['code']="actions/22/dialog-xml-editor"
    ['column']="actions/22/object-columns"
    ['compress-image']=
    ['config']="actions/22/configure"
    ['connect_share_on']="status/22/state-ok"
    ['connect_share']="status/22/cloudstatus"
    ['convert']="actions/22/gtk-convert"
    ['copy-to-library']=
    ['cover_flow']=
    ['debug']="actions/22/debug-run"
    ['default_cover']="@calibre-ebook"
    ['devices/bambook']=
    ['devices/boox']=
    ['devices/folder']="places/22/folder-download"
    ['devices/ipad']=
    ['devices/italica']=
    ['devices/itunes']=
    ['devices/kindle']=
    ['devices/nook']=
    ['devices/tablet']="devices/22/tablet"
    ['dialog_error']="status/64/dialog-error"
    ['dialog_information']="status/64/dialog-information"
    ['dialog_question']="status/64/dialog-question"
    ['dialog_warning']="status/64/dialog-warning"
    ['dictionary']=
    ['diff']="actions/22/kr_comparedirs"
    ['document-encrypt']="actions/22/document-encrypt"
    ['document-import']="actions/22/document-import"
    ['document-new']="actions/22/document-new"
    ['document_open']="actions/22/document-open"
    ['document-split']="actions/22/split"
    ['donate']="actions/16/help-donate"
    ['dot_green']="actions/22/flag-green"
    ['dot_red']="actions/22/flag-red"
    ['download-metadata']="actions/22/edit-download"
    ['drm-locked']="actions/22/object-locked"
    ['drm-unlocked']="actions/22/object-unlocked"
    ['edit_book']="apps/48/calibre-ebook-edit"
    ['edit-clear']="actions/22/edit-clear"
    ['edit-copy']="actions/22/edit-copy"
    ['edit-cut']="actions/22/edit-cut"
    ['edit_input']="actions/22/edit-entry"
    ['edit-paste']="actions/22/edit-paste"
    ['edit-redo']="actions/22/edit-redo"
    ['edit-select-all']="actions/22/edit-select-all"
    ['edit-undo']="actions/22/edit-undo"
    ['eject']="actions/22/media-eject"
    ['embed-fonts']="actions/22/insert-text"
    ['exec']="actions/22/run-build"
    ['filter']="actions/22/view-filter"
    ['folder_saved_search']="places/symbolic/folder-saved-search-symbolic"
    ['font']="actions/16/font-face"
    ['font_size_larger']="actions/22/format-font-size-more"
    ['font_size_smaller']="actions/22/format-font-size-less"
    ['format-fill-color']="actions/22/format-fill-color"
    ['format-indent-less']="actions/22/format-indent-less"
    ['format-indent-more']="actions/22/format-indent-more"
    ['format-justify-center']="actions/22/format-justify-center"
    ['format-justify-fill']="actions/22/format-justify-fill"
    ['format-justify-left']="actions/22/format-justify-left"
    ['format-justify-right']="actions/22/format-justify-right"
    ['format-list-ordered']="actions/22/format-list-ordered"
    ['format-list-unordered']="actions/22/format-list-unordered"
    ['format-text-bold']="actions/22/format-text-bold"
    ['format-text-color']="actions/22/format-text-color"
    ['format-text-heading']=
    ['format-text-hr']=actions/22/menu_new_sep
    ['format-text-italic']="actions/22/format-text-italic"
    ['format-text-strikethrough']="actions/22/format-text-strikethrough"
    ['format-text-subscript']="actions/22/format-text-subscript"
    ['format-text-superscript']="actions/22/format-text-superscript"
    ['format-text-underline']="actions/22/format-text-underline"
    ['forward']="actions/22/go-next"
    ['gear']="actions/16/run-build"
    ['generic-library']=
    ['gmail_logo']="actions/22/im-google"
    ['grid']="actions/16/view-grid"
    ['help']="actions/22/help-contents"
    ['heuristics']="actions/22/story-editor"
    ['highlight_only_off']=status/22/camera-off
    ['highlight_only_on']=status/22/camera-on
    ['hotmail']="actions/22/im-msn"
    ['html-fix']="actions/22/viewhtml"
    ['icon_choose']="actions/22/view-list-icons"
    ['identifiers']="actions/22/view-barcode"
    ['insert-link']="actions/22/insert-link"
    ['jobs']="actions/22/view-task"
    ['keyboard-prefs']="actions/22/configure-shortcuts"
    ['languages']="actions/22/set-language"
    ['library']=
    ['list_remove']="actions/22/list-remove"
    ['lookfeel']="actions/22/games-config-theme"
    ['lt']=
    ['mail']="actions/22/mail-mark-unread"
    ['marked']="actions/22/pin"
    ['merge_books']="actions/22/merge"
    ['merge']="actions/22/merge"
    ['metadata']="actions/22/tag"
    ['mimetypes/azw2']=
    ['mimetypes/azw3']=
    ['mimetypes/bmp']=mimetypes/64/image-bmp
    ['mimetypes/cbr']=mimetypes/64/application-x-rar
    ['mimetypes/cbz']=mimetypes/64/application-zip
    ['mimetypes/computer']=devices/64/computer
    ['mimetypes/dir']=mimetypes/64/inode-directory
    ['mimetypes/djvu']=mimetypes/64/image-vnd.djvu
    ['mimetypes/docx']=mimetypes/64/application-wps-office.docx
    ['mimetypes/epub']=mimetypes/64/application-epub+zip
    ['mimetypes/fb2']=mimetypes/64/application-x-zip-compressed-fb2
    ['mimetypes/gif']=mimetypes/64/image-gif
    ['mimetypes/html']=mimetypes/64/text-html
    ['mimetypes/jpeg']=mimetypes/64/image-jpeg
    ['mimetypes/lit']=
    ['mimetypes/lrf']=
    ['mimetypes/lrx']=
    ['mimetypes/mobi']=
    ['mimetypes/odt']=mimetypes/64/application-vnd.oasis.opendocument.text
    ['mimetypes/opml']=mimetypes/64/text-x-opml
    ['mimetypes/pdf']=mimetypes/64/application-pdf
    ['mimetypes/png']=mimetypes/64/image-png
    ['mimetypes/rar']=mimetypes/64/application-x-rar
    ['mimetypes/rtf']=mimetypes/64/text-rtf
    ['mimetypes/snb']=
    ['mimetypes/svg']=mimetypes/64/image-svg+xml
    ['mimetypes/tpz']=
    ['mimetypes/txt']=mimetypes/64/text-plain
    ['mimetypes/unknown']=mimetypes/64/unknown
    ['mimetypes/xps']=
    ['mimetypes/zero']=mimetypes/64/application-x-zerosize
    ['mimetypes/zip']=mimetypes/64/application-zip
    ['minusminus']="emblems/16/vcs-removed"
    ['minus']="actions/symbolic/list-remove-symbolic"
    ['modified']="actions/22/modified"
    ['network-server']="actions/22/network-connect"
    ['news']="actions/22/news-subscribe"
    ['next']="actions/22/media-skip-forward"
    ['ok']="actions/22/dialog-ok"
    ['page']="actions/22/view-fullscreen"
    ['plugboard']="actions/22/application-menu"
    ['plugins/mobileread']=
    ['plugins/plugin_deprecated']=
    ['plugins/plugin_disabled_invalid']=
    ['plugins/plugin_disabled_ok']=
    ['plugins/plugin_disabled_valid']=
    ['plugins/plugin_new_invalid']=
    ['plugins/plugin_new']=
    ['plugins/plugin_new_valid']=
    ['plugins/plugin_updater']=
    ['plugins/plugin_updater_updates']=
    ['plugins/plugin_upgrade_invalid']=
    ['plugins/plugin_upgrade_ok']=
    ['plugins/plugin_upgrade_valid']=
    ['plugins']="actions/22/plugins"
    ['plusplus']="emblems/16/vcs-added"
    ['plus']="actions/symbolic/list-add-symbolic"
    ['polish']=
    ['previous']="actions/22/media-skip-backward"
    ['print']="actions/22/document-print"
    ['publisher']="actions/22/view-media-publisher"
    ['quickview']=actions/22/quickview
    ['random']="actions/16/roll"
    ['rating']="emblems/16/rating"
    ['reader']=
    ['remove_books']="actions/22/edit-delete"
    ['reports']="actions/22/view-statistics"
    ['resize']="actions/22/transform-scale"
    ['restart']=actions/22/start-over
    ['rotate-right']="actions/22/object-rotate-right"
    ['save']="actions/22/document-save"
    ['scheduler']="actions/22/view-time-schedule"
    ['scroll']="actions/22/insert-page-break"
    ['sd']="devices/64/media-flash-sd-mmc"
    ['search_add_saved']=
    ['search_copy_saved']=
    ['search_delete_saved']=
    ['search']="actions/16/search"
    ['series']="actions/22/view-file-columns"
    ['similar']=
    ['smarten-punctuation']="actions/22/format-text-blockquote"
    ['snippets']="actions/22/code-context"
    ['sort']="actions/16/view-sort-ascending"
    ['spell-check']="actions/22/tools-check-spelling"
    ['store']="actions/22/cloud-download"
    ['subset-fonts']=
    ['swap']="actions/22/document-swap"
    ['sync']="actions/22/upload-media"
    ['sync-right']="actions/16/mail-forwarded"
    ['tags']="actions/22/tag"
    ['tb_folder']=places/22/folder-add
    ['template_funcs']="actions/22/template"
    ['textures/dark_cloth']=
    ['textures/dark_wood']=
    ['textures/grey_wash_wall']=
    ['textures/light_wood']=
    ['textures/subtle_wood']=
    ['toc']="actions/22/gtk-index"
    ['trash']="actions/22/trash-empty"
    ['trim']="actions/22/transform-crop"
    ['tweak']=actions/22/tool-tweak
    ['tweaks']="actions/22/view-media-equalizer"
    ['unpack-book']="actions/22/archive-extract"
    ['user_profile']="actions/22/user"
    ['viewer']="apps/48/calibre-viewer"
    ['view-image']="actions/22/view-preview"
    ['view']="actions/22/preview"
    ['view-refresh']="actions/22/view-refresh"
    ['vl']=
    ['window-close']="actions/22/window-close"
    ['wizard']="actions/22/tools-wizard"
)

shopt -s globstar
total=0
replaced=0
for i in "${CALIBRE_RESOURCES_PATH}/images/"**/*"${CALIBRE_EXT}"; do
    total=$(( $total + 1 ))
    i="${i#${CALIBRE_RESOURCES_PATH}/images/}"
    i="${i%${CALIBRE_EXT}}"
    c="${mappings["$i"]}"
    if [[ -n "$c" ]]; then
        if [[ "$c" == @* ]]; then
            f="src/${c#@}${BREEZE_EXT}"
        else
            f="${BREEZE_ICONS_PATH}/${c}${BREEZE_EXT}"
        fi
        if [[ -f "$f" ]]; then
            install -dm755 "$OUTPUT_DIR/$(dirname "$i")" &&
            rsvg-convert -d 96 -p 96 -w $CALIBRE_ICON_SIZE -h $CALIBRE_ICON_SIZE -f png -o "$OUTPUT_DIR/$i${CALIBRE_EXT}" "$f" &&
            optipng "$OUTPUT_DIR/$i${CALIBRE_EXT}" 2> /dev/null &&
            replaced=$(( $replaced + 1 ))
        else
            echo "Missing Breeze icon: $c"
        fi
    else
        echo "Missing icon: $i"
    fi
done

echo "Replaced icons: $replaced/$total"
