kd = require 'kd'
React = require 'kd-react'

List = require 'app/components/list'
StackTemplateItem = require '../stacktemplateitem'


module.exports = class DraftsListView extends React.Component

  onAddToSidebar: (template) -> @props.onAddToSidebar template.get '_id'


  onRemoveFromSidebar: (template) -> @props.onRemoveFromSidebar template.get '_id'


  numberOfSections: -> 1


  numberOfRowsInSection: -> @props.templates?.size or 0


  renderSectionHeaderAtIndex: -> null


  renderRowAtIndex: (sectionIndex, rowIndex) ->

    template = @props.templates.toList().get(rowIndex)
    onAddToSidebar = @lazyBound 'onAddToSidebar', template
    onRemoveFromSidebar = @lazyBound 'onRemoveFromSidebar', template

    isVisible = @props.sidebarDrafts.get template.get('_id')

    <StackTemplateItem
      isVisibleOnSidebar={isVisible}
      template={template}
      onOpen={@props.onOpenItem}
      onAddToSidebar={onAddToSidebar}
      onRemoveFromSidebar={onRemoveFromSidebar}
    />


  renderEmptySectionAtIndex: -> <div>You don't have any draft stack templates.</div>


  render: ->

    <List
      numberOfSections={@bound 'numberOfSections'}
      numberOfRowsInSection={@bound 'numberOfRowsInSection'}
      renderSectionHeaderAtIndex={@bound 'renderSectionHeaderAtIndex'}
      renderRowAtIndex={@bound 'renderRowAtIndex'}
      renderEmptySectionAtIndex={@bound 'renderEmptySectionAtIndex'}
      sectionClassName='HomeAppViewStackSection'
    />

