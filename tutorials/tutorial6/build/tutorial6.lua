projectList = { "Hierarchy",
                "Rotations",
                "Scale",
                "Translation" }

-- For each project name in "projectList", setup a new project.
for i, projectName in ipairs(projectList) do
    SetupProject(projectName, "../" .. projectName .. ".cpp")
end
