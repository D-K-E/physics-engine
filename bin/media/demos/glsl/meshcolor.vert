#version 410
layout(location = 0) in vec3 aPos;
layout(location = 1) in vec3 aNormal;
layout(location = 2) in vec2 aTexCoord;
layout(location = 3) in vec3 aTan;
layout(location = 4) in vec3 aBiTan;

uniform mat4 view;
uniform mat4 model;
uniform mat4 projection;
uniform mat4 lightSpaceMatrix;

out vec3 FragPos;
out vec4 FragPosLightSpace;
out vec2 TexCoord;
out vec3 Normal;

void main() {
  FragPos = vec3(model * vec4(aPos, 1.0));
  TexCoord = aTexCoord;
  Normal = vec3(model * vec4(aNormal, 1.0));
  /*TBN = mat3(vec3(model * vec4(aTan, 0.0)), vec3(model * vec4(aBiTan, 0.0)),
             vec3(model * vec4(aNormal, 0.0)));*/
  FragPosLightSpace = lightSpaceMatrix * vec4(FragPos, 1.0);
  gl_Position = projection * view * model * vec4(aPos, 1.0);
}
