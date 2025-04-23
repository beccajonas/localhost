<DrawerFrame
  id="imageDetailsDrawer"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter="{{ actAsAdmin.value }}"
  showHeader={true}
  showOverlay={true}
  width="large"
>
  <Header>
    <Text
      id="drawerTitle1"
      value="### {{ imageListTable.selectedRow?.name ?? url.searchParams.image }} {{ imageListTable.selectedRow?.variant ??url.searchParams.variant }}"
      verticalAlign="center"
    />
    <Button
      id="drawerCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="imageDetailsDrawer"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="imageEditMode"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Switch
      id="imageEditMode"
      disabled="{{ !actAsAdmin.value }}"
      hidden="{{ !actAsAdmin.value }}"
      label="Edit mode"
    />
    <EditableText
      id="currentImageName"
      editIcon="bold/interface-edit-write-1"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="Image Name"
      placeholder="Enter value"
      readOnly="true"
      style={{ ordered: [] }}
      value="{{ getImageDetails.data?.name }}"
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getImageDependencies"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </EditableText>
    <EditableText
      id="currentImageVariant"
      editIcon="bold/interface-edit-write-1"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="Variant"
      placeholder="Enter value"
      readOnly="true"
      value="{{ getImageDetails.data?.variant }}"
    />
    <Form
      id="editImageForm"
      disabled="{{ !imageEditMode.value }}"
      disableSubmit=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle6" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="textInput19"
          formDataKey="repositoryName"
          label="ERC Repository"
          placeholder="Enter value"
          readOnly="true"
          required="{{ imageEditMode.value }}"
          value="{{ getImageDetails.data?.repositoryName }}"
        />
        <TextInput
          id="textInput41"
          formDataKey="buildUrl"
          label="Build Trigger URL"
          placeholder="Enter value"
          required="{{ imageEditMode.value }}"
          value="{{ getImageDetails.data?.buildUrl }}"
        />
        <TextInput
          id="textInput20"
          formDataKey="deployUrl"
          label="Deploy URL"
          placeholder="Enter value"
          required="{{ imageEditMode.value }}"
          value="{{ getImageDetails.data?.deployUrl }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton6"
          submit={true}
          submitTargetId="editImageForm"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <IconText
      id="iconText1"
      icon={
        '{{ getImageDetails.data?.locked ? "/icon:bold/interface-lock" : "/icon:bold/interface-unlock"  }}'
      }
      text={'{{ getImageDetails.data?.locked ? "Locked" : "Unlocked"  }}'}
    />
    <EditableText
      id="date2"
      label="Updated at"
      placeholder="Enter value"
      readOnly="true"
      value="{{ new Date(getImageDetails.data?.updatedAt).toDateString() }}"
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getImagesPaginated"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </EditableText>
    <EditableText
      id="date1"
      editIcon="bold/interface-edit-write-1"
      inputTooltip="`Enter` to save, `Esc` to cancel"
      label="Created at"
      placeholder="Enter value"
      readOnly="true"
      value="{{ new Date(getImageDetails.data?.createdAt).toDateString() }}"
    />
    <Include src="./imageRelationsContainer.rsx" />
  </Body>
  <Footer>
    <Button
      id="button3"
      hidden="{{ !actAsAdmin.value }}"
      style={{ ordered: [{ border: "danger" }] }}
      styleVariant="outline"
      text="Delete Image"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="deleteImageAlert"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button2"
      disabled=""
      hidden="{{ !imageEditMode.value }}"
      submit={true}
      submitTargetId="editImageForm"
      text="Save Image"
    />
  </Footer>
</DrawerFrame>
